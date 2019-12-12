# HTML5 Validator Action

This action checks the syntax of your html files in the path that you provide. It used [html5validtor](https://github.com/svenkreiss/html5validator) and a docker image that I build from it found [here](https://github.com/Cyb3r-Jak3/html5validator-docker).

## Inputs

### `Root`

**Required** The root path of the files you want to check. Default `"."`.

### `Ad-args`

Additional arguments to pass to html5validator.

## Outputs

### `result`

The exit code of the validation.

## Example usage

```yaml
    - name: Test Files
      uses: Cyb3r-Jak3/html5validator-action@master
      with:
        root: tests/valid/
```

Please use the latest version and not master.

```yaml
 uses: Cyb3r-Jak3/html5validator-action@v0.1
 ```
