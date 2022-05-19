# GitHub Action for MEGA

This Action for [MEGA](https://mega.nz/) enables arbitrary actions with the `MEGAcmd` command-line client, including uploading and downloading from a remote folder.

### Secrets

* `USERNAME` - **Optional**. Email to a MEGA account. Required to upload.
* `PASSWORD` - **Optional**. Password to a MEGA account. Required to upload.

#### Example

To download a file using MEGAcmd. In this case we are downloading a file specified by a public link, which does not require being logged in: 

```yaml
- name: Download
        uses: Difegue/action-megacmd@master
        with:
          args: get https://mega.nz/#F!ABcD1E2F!gHiJ23k-LMno45PqrSTUvw /path/to/local/folder
```

To upload a file using MEGAcmd:

```yaml
- name: Upload 
        uses: Difegue/action-megacmd@master
        with:
          args: put /path/to/local/folder /exportedstuff/
        env:
          USERNAME: ${{ secrets.USERNAME }}
          PASSWORD: ${{ secrets.PASSWORD }}
```
## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

