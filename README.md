= mkdeb-flapjack

This is a vagrant vm definition with puppet provisioning to create a ubuntu system suitable for maintaining the flapjack debian package repository, and pushing it to s3 (packages.flapjack.io).

This depends on [omnibus-flapjack](https://github.com/flpjck/omnibus-flapjack) to generate new packages.

= commands

update deb package repository with a new flapjack package:

```
TODO
```

sync deb repo to packages.flapjack.io on s3:

``` bash
s3cmd --verbose --acl-public --delete-removed  sync flapjack-packages/ s3://packages.flapjack.io/
```

