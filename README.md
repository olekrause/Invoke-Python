# Invoke-Python PowerShell Function

## Description
`Invoke-Python` is a PowerShell function designed to execute Python scripts or code blocks. It provides flexibility in how Python is invoked, allowing for script execution from a file path or directly from a script block, with optional user interaction.

## Dependencies
- Python must be installed and added to the system PATH.

## Parameters
- `ScriptBlock` (string): The Python code to execute as a script block.
- `Path` (string): The file path to the Python script to execute.
- `Interaction` (bool): A flag indicating whether user interaction is required.

## Usage
The function determines how to execute Python based on the provided parameters using a bitwise calculation. Here are the possible combinations:

1. **ScriptBlock only**:
    ```powershell
    Invoke-Python -ScriptBlock "print('Hello, World!')"
    ```

2. **Path only**:
    ```powershell
    Invoke-Python -Path "C:\path\to\script.py"
    ```

3. **ScriptBlock with Interaction**:
    ```powershell
    Invoke-Python -ScriptBlock "print('Hello, World!')" -Interaction $true
    ```

4. **Path with Interaction**:
    ```powershell
    Invoke-Python -Path "C:\path\to\script.py" -Interaction $true
    ```

## Function Logic
The function uses a bitwise calculation to determine the state and execute the appropriate Python command:
- `1`: ScriptBlock only
- `2`: Path only
- `5`: ScriptBlock with Interaction
- `6`: Path with Interaction

If an invalid combination of parameters is provided, the function throws an error.

## Example
```powershell
# Example: Execute a Python script from a file path
Invoke-Python -Path "C:\path\to\script.py"

# Example: Execute a Python script block
Invoke-Python -ScriptBlock "print('Hello, World!')"
```
## Error Handling
If an invalid combination of parameters is provided, the function will throw an error with the message "Invalid combination of parameters."

## License
This project is licensed under the MIT License.
