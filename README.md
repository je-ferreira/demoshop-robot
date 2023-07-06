# Practical Exercise Robot Framework

### To run this project locally

You need to download and install:

- [Python 3](https://www.python.org/downloads/)
- [Chrome Driver](https://chromedriver.chromium.org/downloads): Please choose according to the browser version installed in your machine.

After, run CMD as Administrator and execute the commands below:

- Robot Framework: `pip install --upgrade robotframework`
- Selenium Library: `pip install --upgrade robotframework-seleniumlibrary` 

And then, download this project and follow this steps:

- Run CMD as Administrator and go to the project path;
- Execute the command `robot -d results tests/register-test.robot` to run the tests.

 
### Files by directories


|               Directory | Files in folder                                                               |
| ----------------------: | ----------------------------------------------------------------------------- |
|    `resources/components` | **register-components.robot** with components of register page.         |
|    `resources/data` | **general.robot** and **register-data.robot** with data necessary to tests.        |
|    `resources/pages` | **register-page.robot** contains the actions of register page.        |
|         `tests` | **register-test.robot** with the test cases for register tests.                       |
