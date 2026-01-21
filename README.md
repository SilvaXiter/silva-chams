1. To set "NORMAL MODE" (App is working)

Use this when you want users to be able to use the cheat.

    Status: "online"

    Version: "2.1.0" (Must match the version inside your Python code)

JSON

{
  "status": "online",
  "version": "2.1.0",
  ...
}

2. To set "MAINTENANCE MODE" (Locks the App)

Use this when you are fixing something and want to block everyone from using the cheat.

    Status: "maintenance"

    Version: "2.1.0"

JSON

{
  "status": "maintenance",
  "version": "2.1.0",
  ...
}

3. To set "UPDATE MODE" (Forces Download)

Use this when you have finished a new version (e.g., v2.2.0) and want to force users to download the new EXE.

    Status: "online"

    Version: "2.2.0" (Must be higher than the version in your Python code)

JSON

{
  "status": "online",
  "version": "2.2.0",
  ...
}
