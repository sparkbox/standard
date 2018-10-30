# Harvest

If you'd like to use the HH:MM format locally you can!

### Prior to the 2017 Update

By default, Harvest's time format is in decimal. To change this (locally) enter the following command in terminal:
```defaults write com.getharvest.harvestxapp TimeFormat hours_minutes```

### 2017 Update

To read your settings, run:
```
defaults read ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/group.com.getharvest.Harvest.Documents.plist
```

To change the time format to HH:MM, run

```
defaults write ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/group.com.getharvest.Harvest.Documents.plist TimeFormat hours_minutes
```

Restart the Harvest App, and it should now display HH:MM (I tested this)

To change back to decimal, run:
```
defaults write ~/Library/Containers/com.getharvest.harvestxapp/Data/Library/Preferences/group.com.getharvest.Harvest.Documents.plist TimeFormat decimal
```

Thanks to [this gist](https://gist.github.com/rcdilorenzo/ddee4da296e157e48b1efd0d1a193c3d)
