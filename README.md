# HTML5 Validator Action

This action checks the syntax of your html files in the path that you provide.

## Inputs

### `Root`

**Required** The root path of the files you want to check. Default `"."`.

## Outputs

### `result`

The result of the command

## Example usage

```yaml
    - name: Test Files
      uses: Cyb3r-Jak3/html5validator-action@master
      with:
        Root: tests/valid/
```
