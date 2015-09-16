PolyglotShiva 0.1.0

Tool to use the 600+ strings with 26 languages via PolyglotGamedev opensource translation project spreadsheet with the Shiva3D engine.

--------------- Demo

First Import the Archive .ste file, preferably into an empty project so you can assess it's components.
Test and verify it works. The import to your project.

--------------- Using it in your own project

Import, then delete PolyglotMainAI and PolyglotHUD once you have no more use for them.

Check the Fonts you intend to use. The demo supplies a set, but notice that Thai and Traditional Chinese are 6 MB each.
The FontDefinitions.xml contains the languages currently in the Polyglot Mastersheet and the corresponding fonts included in the package.
When creating a font, use the Dynamic setting, and leave the System Font unchecked.
Selecting new fonts for yourself is highly recommended.

Add the FontDefinitions file and the xml for the languages you wish to support to Game Resources.

--------------- Basics

I18N onInit calls loadXML and loadXMLFontDefinitions to prepare the hashtables.
Call onSetLanguageOverride and onSetFontOverride as needed from your own code.

Prepare your hudComponents by setting their Text fields with String Ids from the mastersheet, f.ex. MENU_LABEL_WELCOME
Loop through your hudComponents and send their tags to onLocalizeHudComponent to have them localized.

--------------- Advanced string concatenation

The code supports rudimentary {0} syntax where one set of brackets may include custom text that will not be touched.
Usual form: MENU_LABEL_MUSIC{ : Skaven}  or GAME_INVENTORY_AMMO{ : 10}
Dual form: MENU_IO_SAVE{ / }MENU_LABEL_LANGUAGE


--------------- Adding more strings

Easiest is to append to the Mastersheet and run the lua converter supplied with this package.

Using separate files is currently possible, but it would be wiser to concatenate multiple string sources in the long run
instead of handling them separately to avoid complex calling code.
In any case, this.sDefaultFilename ( ) is set to "PolyMaster-100|", this will need to be modified to support separate files.

--------------- References

Both I18N and the lua converter are expanded and modified from http://error454.com/2014/04/11/shiva-localization/

PolyglotGamedev links:
The MasterSheet - bit.ly/1ESPiO6 
Facebook - https://www.facebook.com/polyglotgamedev
Twitter - https://twitter.com/PolyglotGamedev



