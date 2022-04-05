# HTML5 Validator Action

![Actions Status](https://github.com/Cyb3r-Jak3/html5validator-action/workflows/Action%20Test/badge.svg?branch=master) ![Actions Status](https://github.com/Cyb3r-Jak3/html5validator-action/workflows/Integration/badge.svg) ![Actions Status](https://github.com/Cyb3r-Jak3/html5validator-action/workflows/Build%20Test/badge.svg?branch=master)

This action checks the syntax of your html files in the path you specify.  
It used [html5validator](https://github.com/svenkreiss/html5validator) and a [docker image that I build from it](https://github.com/Cyb3r-Jak3/html5validator-docker).

For help getting started, check out the [wiki](https://github.com/Cyb3r-Jak3/html5validator-action/wiki/Getting-Started).

## Inputs

| Flag             | Description                                                                   | Default   |
|------------------|-------------------------------------------------------------------------------|-----------|
| `root`           | The root path of the files you want to check                                  |           |
| `config`         | Path to config file to use.                                                   |           |
| `format`         | The format for logging. Supported values: `json, xml, gnu, text`.             |           |
| `log_level`      | The log level to use. Supported values: `DEBUG, INFO, WARNING`.               | `WARNING` |
| `css`            | Enable to check css. Supported values: `true, false`                          | `false`   |
| `blacklist`*     | The names of files or directories to blacklist. **These are not full paths.** |           |
| `skip_git_check` | Skip checking that the repo has been checked out                              |           |

* Examples of `blacklist`

Correct Example:

```yaml
    - name: HTML5Validator
      uses: Cyb3r-Jak3/html5validator-action
      with:
        root: tests/
        blacklist: invalid
```

Incorrect Example:

```yaml
    - name: HTML5Validator
      uses: Cyb3r-Jak3/html5validator-action
      with:
        root: tests/
        blacklist: tests/invalid
```

## Outputs

### `result`

The exit code of the validation.

## Example usage

```yaml
      uses: Cyb3r-Jak3/html5validator-action
      with:
        root: tests/valid/
```

A log file is automatically created. To retrieve it, use Github's upload artifact action after the validator action.

```yaml
    - uses: actions/upload-artifact@v3
      with:
        name: log
        path: log.log
```

## Keep up-to-date with GitHub Dependabot

Since [Dependabot](https://docs.github.com/en/github/administering-a-repository/keeping-your-actions-up-to-date-with-github-dependabot)
has [native GitHub Actions support](https://docs.github.com/en/github/administering-a-repository/configuration-options-for-dependency-updates#package-ecosystem),
to enable it on your GitHub repo all you need to do is add the `.github/dependabot.yml` file:

```yaml
version: 2
updates:
  # Maintain dependencies for GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
```
