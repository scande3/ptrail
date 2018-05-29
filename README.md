# Ptrail

This is an application to show papertrail association version interactions. Of note, it seems any `has_many` and
`has_many_through` relationships will always fail to keep history. This may be intended behavior?

## To Use

No configuration is needed! Simply pull this down and run the standard commands of:
```
  bundle install
  rake db:migrate
```

The sample is all in the `db\seeds.rb` file. Run the following to have that execute and show versions as sample data
changes:
```
  rake db:seed
```


