## Submenu

This extension adds a useful second layer of navigation to the main radiant admin interface. It's meant for use by extension authors and works much like the tabs. I (will) use it to group together the various other extensions that are relevant to readers (rather than creating a tab for each one) and to offer a better site-chooser in multi_site.

## Status

New but simple and properly tested. Should just work.

## Installation

	git submodule add git://github.com/spanner/radiant-submenu-extension.git vendor/extensions/reader

No migrations. One stylesheet to bring across:

	rake radiant:extensions:submenu:update

## Configuration

Nothing is required. You will need to make sure this extension loads before any that make use of it, but probably after multi_site. This is what I have at the moment:

	config.extensions = [  :share_layouts, :multi_site, :submenu, :taggable, :reader, :all ]

## Usage

In the activation method of an extension:

	admin.tabs.add('Extension')
	admin.tabs['Extension'].add_link('something', '/somewhere')
	admin.tabs['Extension'].add_link('some other thing', '/elsewhere')

## Author and copyright

* Copyright spanner ltd 2009.
* Released under the same terms as Rails and/or Radiant.
* Contact will at spanner.org
