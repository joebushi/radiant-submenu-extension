## Submenu

This extension adds a useful second layer of navigation to the main radiant admin interface. It's meant for use by extension authors and works much like the tabs. I (will) use it to group together the various other extensions that are relevant to readers (rather than creating a tab for each one) and to offer a better site-chooser in multi_site.

## Status

New. Nearly ready. Properly tested. Not yet styled in.

(I haven't sorted out the presentation yet but the principle works)

## Installation

No migrations or updates:

	git submodule add git://github.com/spanner/radiant-submenu-extension.git vendor/extensions/reader

## Usage

In the activation method of an extension:

	admin.tabs.add('Extension')
	admin.tabs['Extension'].add_link('something', '/somewhere')
	admin.tabs['Extension'].add_link('some other thing', '/elsewhere')
    
There is no provision at the moment for anything other than links.

## Author and copyright

* Copyright spanner ltd 2009.
* Released under the same terms as Rails and/or Radiant.
* Contact will at spanner.org
