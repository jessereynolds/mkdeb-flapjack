= commands

sync deb repo to packages.flapjack.io on s3:

``` bash
s3cmd --verbose --acl-public --delete-removed  sync flapjack-packages/ s3://packages.flapjack.io/
```

