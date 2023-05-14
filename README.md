
# Shop Robbery Script for FiveM -- ESX

This script is a simple shop robbery script created by SeriumTW for ESX servers. It is provided for free, as there is a lack of decent shop robbery scripts available.

This version of the script has not been extensively tested. If you encounter any issues or have any suggestions for improvements, please feel free to contact me.

## Installation

1. Download the script files.
2. Place the script folder in the resources directory of your FiveM server.
3. Add the following line to your server.cfg file:

```markdown
   ensure shoprobbery
```

4. Restart your FiveM server.

## Usage

To initiate a shop robbery, players need to enter a designated shop location and press the interaction key (default: "E"). Once the robbery is started, a notification will be sent to the police using the "ps-dispatch" script ([ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)). Players must then wait for the robbery duration to complete.

During the robbery, players will receive rewards based on the configuration settings. The rewards may include items such as "ssd16tb" (example item name). The duration and cooldown of the robbery can be customized in the configuration file.

## Configuration

The script includes a configuration file where you can customize various settings such as the minimum number of police required, robbery locations, rewards, cooldown duration, and more. Please refer to the configuration section in the script file to make any necessary adjustments.

## Dependencies

- ESX Framework: Make sure you have ESX properly installed and functioning on your FiveM server.
- ps-dispatch Script: This script is used to send robbery notifications to the police. You can find the ps-dispatch script on GitHub at the following link: ([ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)). Follow the installation instructions provided in the ps-dispatch script to integrate it correctly into your FiveM server.

## Credits

- Script created by SeriumTW

## License

This script is provided for free and can be used and modified without any restrictions. However, the original credit must be given to SeriumTW for creating the script.

Please note that the script is available only in English language. For any inquiries regarding translations or modifications, please contact the undersigned via email.

For more scripts and resources, visit [SeriumTW's GitHub](https://github.com/SeriumTW).
