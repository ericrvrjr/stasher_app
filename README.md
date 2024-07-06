## Getting Started

### Prerequisites:

1. A computer (Windows, macOS, or Linux) with an internet connection.
2. Git installed on the computer. You can download it from the official Git website https://git-scm.com/downloads.
3. Flutter installed on the computer. You can follow the steps on how to install it from the official Flutter website. https://docs.flutter.dev/get-started/install
4. Optional (Recommended): A code editor like Visual Studio Code (free download available) which can simplify working with Git repositories https://code.visualstudio.com/.

### Cloning the Repository:

1. Right click and copy this [link](https://github.com/ericrvrjr/stasher_app).

2. Open Command Prompt/Terminal:
    - Windows: Search for "Command Prompt" or "cmd" in the Start menu and open it.
    - macOS/Linux: Open the Terminal application (usually found in Utilities folder).

3. Navigate to the Desired Folder:

    - Use the cd command to change directories in the command prompt/terminal. Navigate to the location where you want to clone the project's files. For example, if you want it on your Desktop, type:
        ```
        cd Desktop
        ```

    - Press Enter after typing the command.

4. Clone the Repository:

    - Use the git clone command followed by the repository URL to download the project's files. For example, if the URL is "https://github.com/ericrvrjr/stasher_app" type:
        ```
        git clone https://github.com/ericrvrjr/stasher_app
        ```
    - press Enter after typing the command.

    - Git will prompt you for your username and password for the Git hosting platform (if required).

### Running the App (Using a Code Editor - Recommended):

 1. Open the Project Folder:
    - Open the folder created during cloning (e.g., "my_flutter_project"). You can do this using your file explorer or directly from the command prompt/terminal.

 2. Open in VS Code (Optional):
    - If you downloaded Visual Studio Code, right-click anywhere inside the project folder and select "Open with Code" (or similar option depending on your operating system). This will open the project in VS Code, which provides a user-friendly interface for working with Flutter projects.

 3. Run the App:

    - In VS Code, find the terminal window at the bottom (or create a new one). Make sure you're inside the project folder (the path should be displayed in the terminal).
    - Type the following command and press Enter:
        ```
        flutter run
        ```
    ** This will start the Flutter development tools and attempt to run your app on a connected device or emulator.

### Running the App (Without a Code Editor):

*** Note: This method is less user-friendly and requires some familiarity with command lines.

 1. Open Terminal in Project Folder:
    If you're not using VS Code, make sure you're in the project folder using the cd command in the terminal (refer to step 3 of the "Cloning the Repository" section).

 2. Run the App:

    - Type the following command and press Enter:
        ```
        flutter run
        ```

    - This will start the Flutter development tools and attempt to run your app on a connected device or emulator.

 3. Choosing a Device or Emulator:

    By default, Flutter will try to run the app on a connected mobile device. If no device is connected, it will ask if you want to launch an emulator (a simulated device on your computer).
    To launch an emulator, select the desired device type (e.g., Pixel 4) and operating system version (e.t., Android 13) and click "Launch" (in VS Code) or choose the appropriate option in the terminal.

### Additional Notes:

- The first time you run flutter run, it might take some time to download additional dependencies needed for the project.
- If you encounter any errors during the process, consult the developer who created the project for further assistance.