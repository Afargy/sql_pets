SELECT    CONCAT(
          ps.name,
          ' (age:',
          ps.age,
          ',gender:''',
          ps.gender,
          ''',address:''',
          ps.address,
          ''')'
          ) AS person_information
FROM      person AS ps
ORDER BY  person_information;
