// data for the sample
var appData = {
    getData: function (count) {
        var countries = 'US,Germany,UK,Japan,Italy,Greece'.split(','),
            data = new wijmo.collections.ObservableArray();

        for (var i = 0; i < count; i++) {
            data.push({
                id: i,
                country: countries[i % countries.length],
                date: new Date(2014, i % 12, i % 28),
                amount: Math.random() * 10000,
                active: i % 4 == 0
            });
        }

        return data;
    },
    treeData: [
        {
            name: '\u266B Adriane Simione', items: [
              {
                  name: '\u266A Intelligible Sky', items: [
                    { name: 'Theories', length: '2:02' },
                    { name: 'Giant Eyes', length: '3:29' },
                    { name: 'Jovian Moons', length: '1:02' },
                    { name: 'Open Minds', length: '2:41' },
                    { name: 'Spacetronic Eyes', length: '3:41' }]
              }
            ]
        },
        {
            name: '\u266B Amy Winehouse', items: [
              {
                  name: '\u266A Back to Black', items: [
                    { name: 'Addicted', length: '1:34' },
                    { name: 'He Can Only Hold Her', length: '2:22' },
                    { name: 'Some Unholy War', length: '2:21' },
                    { name: 'Wake Up Alone', length: '3:43' },
                    { name: 'Tears Dry On Their Own', length: '1:25' }]
              },
              {
                  name: '\u266A Live in Paradiso', items: [
                    { name: "You Know That I'm No Good", length: '2:32' },
                    { name: 'Wake Up Alone', length: '1:04' },
                    { name: 'Valerie', length: '1:22' },
                    { name: 'Tears Dry On Their Own', length: '3:15' },
                    { name: 'Rehab', length: '3:40' }]
              }]
        },
        {
            name: '\u266B Black Sabbath', items: [
              {
                  name: '\u266A Heaven and Hell', items: [
                    { name: 'Neon Knights', length: '3:03' },
                    { name: 'Children of the Sea', length: '2:54' },
                    { name: 'Lady Evil', length: '1:43' },
                    { name: 'Heaven and Hell', length: '2:23' },
                    { name: 'Wishing Well', length: '3:22' },
                    { name: 'Die Young', length: '2:21' }]
              },
              {
                  name: '\u266A Never Say Die!', items: [
                    { name: 'Swinging The Chain', length: '4:32' },
                    { name: 'Breakout', length: '3:54' },
                    { name: 'Over To You', length: '2:43' },
                    { name: 'Air Dance', length: '1:34' },
                    { name: 'Johnny Blade', length: '1:02' },
                    { name: 'Never Say Die', length: '2:11' }]
              },
              {
                  name: '\u266A Paranoid', items: [
                    { name: 'Rat Salad', length: '3:44' },
                    { name: 'Hand Of Doom', length: '4:21' },
                    { name: 'Electric Funeral', length: '2:12' },
                    { name: 'Iron Man', length: '3:22' },
                    { name: 'War Pigs', length: '3:13' }]
              }]
        },
        {
            name: '\u266B Brand X', items: [
              {
                  name: '\u266A Unorthodox Behaviour', items: [
                    { name: 'Touch Wood', length: '2:54' },
                    { name: 'Running of Three', length: '1:34' },
                    { name: 'Unorthodox Behaviour', length: '2:23' },
                    { name: 'Smacks of Euphoric Hysteria', length: '3:12' },
                    { name: 'Euthanasia Waltz', length: '2:22' },
                    { name: 'Nuclear Burn', length: '4:01' }]
              }]
        }
    ]
};