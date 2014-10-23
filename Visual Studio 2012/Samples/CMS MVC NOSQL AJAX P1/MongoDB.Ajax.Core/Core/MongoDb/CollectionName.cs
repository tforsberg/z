﻿using System;

namespace MongoDB.Ajax.Core.MongoDb
{
    [AttributeUsage(AttributeTargets.Class, Inherited = true)]
    public class CollectionName : Attribute
    {
        /// <summary>
        /// Initializes a new instance of the CollectionName class attribute with the desired name.
        /// </summary>
        /// <param name="value">Name of the collection.</param>
        public CollectionName(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                throw new ArgumentException("Empty collectionname not allowed", "value");
            }

            Name = value;
        }

        /// <summary>
        /// Gets the name of the collection.
        /// </summary>
        /// <value>The name of the collection.</value>
        public string Name { get; private set; }
    }
}
