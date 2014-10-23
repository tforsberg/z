using System.Collections;
using System.Collections.Specialized;
using System.Text;
using System.Text.RegularExpressions;

namespace MongoDB.Ajax.Core
{
    internal class ParseMaster
    {
        // used to determine nesting levels
        readonly Regex GROUPS = new Regex("\\(");

        readonly Regex SUB_REPLACE = new Regex("\\$");

        readonly Regex INDEXED = new Regex("^\\$\\d+$");

        readonly Regex ESCAPE = new Regex("\\\\.");

        readonly Regex DELETED = new Regex("\\x01[^\\x01]*\\x01");

        /// <summary>
        /// Delegate to call when a regular expression is found.
        /// Use match.Groups[offset + &lt;group number&gt;].Value to get
        /// the correct subexpression
        /// </summary>
        public delegate string MatchGroupEvaluator(Match match, int offset);

        private static string DELETE(Match match, int offset)
        {
            return "\x01" + match.Groups[offset].Value + "\x01";
        }

        private bool ignoreCase;
        private char escapeChar = '\0';

        /// <summary>
        /// Ignore Case?
        /// </summary>
        public bool IgnoreCase
        {
            get { return ignoreCase; }
            set { ignoreCase = value; }
        }

        /// <summary>
        /// Escape Character to use
        /// </summary>
        public char EscapeChar
        {
            get { return escapeChar; }
            set { escapeChar = value; }
        }

        /// <summary>
        /// Add an expression to be deleted
        /// </summary>
        /// <param name="expression">Regular Expression String</param>
        public void Add(string expression)
        {
            Add(expression, string.Empty);
        }

        /// <summary>
        /// Add an expression to be replaced with the replacement string
        /// </summary>
        /// <param name="expression">Regular Expression String</param>
        /// <param name="replacement">Replacement String. Use $1, $2, etc. for groups</param>
        public void Add(string expression, string replacement)
        {
            if (replacement == string.Empty)
                add(expression, new MatchGroupEvaluator(DELETE));

            add(expression, replacement);
        }

        /// <summary>
        /// Add an expression to be replaced using a callback function
        /// </summary>
        /// <param name="expression">Regular expression string</param>
        /// <param name="replacement">Callback function</param>
        public void Add(string expression, MatchGroupEvaluator replacement)
        {
            add(expression, replacement);
        }

        /// <summary>
        /// Executes the parser
        /// </summary>
        /// <param name="input">input string</param>
        /// <returns>parsed string</returns>
        public string Exec(string input)
        {
            return DELETED.Replace(unescape(getPatterns().Replace(escape(input), new MatchEvaluator(replacement))), string.Empty);
            //long way for debugging
            /*input = escape(input);
            Regex patterns = getPatterns();
            input = patterns.Replace(input, new MatchEvaluator(replacement));
            input = DELETED.Replace(input, string.Empty);
            return input;*/
        }

        readonly ArrayList patterns = new ArrayList();
        private void add(string expression, object replacement)
        {
            Pattern pattern = new Pattern();
            pattern.expression = expression;
            pattern.replacement = replacement;
            //count the number of sub-expressions
            // - add 1 because each group is itself a sub-expression
            pattern.length = GROUPS.Matches(internalEscape(expression)).Count + 1;

            //does the pattern deal with sup-expressions?
            if (replacement is string && SUB_REPLACE.IsMatch((string)replacement))
            {
                string sreplacement = (string)replacement;
                // a simple lookup (e.g. $2)
                if (INDEXED.IsMatch(sreplacement))
                {
                    pattern.replacement = int.Parse(sreplacement.Substring(1)) - 1;
                }
            }

            patterns.Add(pattern);
        }

        /// <summary>
        /// builds the patterns into a single regular expression
        /// </summary>
        /// <returns></returns>
        private Regex getPatterns()
        {
            StringBuilder rtrn = new StringBuilder(string.Empty);
            foreach (object pattern in patterns)
            {
                rtrn.Append(pattern + "|");
            }
            rtrn.Remove(rtrn.Length - 1, 1);
            return new Regex(rtrn.ToString(), ignoreCase ? RegexOptions.IgnoreCase : RegexOptions.None);
        }

        /// <summary>
        /// Global replacement function. Called once for each match found
        /// </summary>
        /// <param name="match">Match found</param>
        private string replacement(Match match)
        {
            int i = 1, j = 0;
            Pattern pattern;
            //loop through the patterns
            while (!((pattern = (Pattern)patterns[j++]) == null))
            {
                //do we have a result?
                if (match.Groups[i].Value != string.Empty)
                {
                    object replacement = pattern.replacement;
                    if (replacement is MatchGroupEvaluator)
                    {
                        return ((MatchGroupEvaluator)replacement)(match, i);
                    }
                    if (replacement is int)
                    {
                        return match.Groups[(int)replacement + i].Value;
                    }
                    //string, send to interpreter
                    return replacementString(match, i, (string)replacement, pattern.length);
                }
                i += pattern.length;
            }
            return match.Value; //should never be hit, but you never know
        }

        /// <summary>
        /// Replacement function for complicated lookups (e.g. Hello $3 $2)
        /// </summary>
        private static string replacementString(Match match, int offset, string replacement, int length)
        {
            while (length > 0)
            {
                replacement = replacement.Replace("$" + length--, match.Groups[offset + length].Value);
            }
            return replacement;
        }

        private readonly StringCollection escaped = new StringCollection();

        //encode escaped characters
        private string escape(string str)
        {
            if (escapeChar == '\0')
                return str;
            Regex escaping = new Regex("\\\\(.)");
            return escaping.Replace(str, new MatchEvaluator(escapeMatch));
        }

        private string escapeMatch(Match match)
        {
            escaped.Add(match.Groups[1].Value);
            return "\\";
        }

        //decode escaped characters
        private int unescapeIndex;
        private string unescape(string str)
        {
            if (escapeChar == '\0')
                return str;
            Regex unescaping = new Regex("\\" + escapeChar);
            return unescaping.Replace(str, new MatchEvaluator(unescapeMatch));
        }

        private string unescapeMatch(Match match)
        {
            return "\\" + escaped[unescapeIndex++];
        }

        private string internalEscape(string str)
        {
            return ESCAPE.Replace(str, "");
        }

        //subclass for each pattern
        private class Pattern
        {
            public string expression;
            public object replacement;
            public int length;

            public override string ToString()
            {
                return "(" + expression + ")";
            }
        }

    }
}
