require 'osx/cocoa'
require 'log'



class Controller < OSX::NSObject
  include OSX
  LOG = Log.classlog(self)

  attr_reader :video_archive

  def init
    super_init
    LOG.init(self)



    return self
  end

  def awakeFromNib # Note: this is called also when the interface is defined from a Xib (xml version of nib)
    LOG.info "---------- New session - awaken from nib/xib ----------"
    NSLog 'Awaken from Nib'    # Test

    ## @status_menu.setup_status_menu(self)    # Crashes when menu is used
    setup_status_menu

    # TODO: Auto-empty inbox goes here (when I've figured how to handle a loop with a suitable delay)
    # Or maybe it goes into Video_archive.
  end

  # Comment out if no status menu is needed
  def setup_status_menu   # I've tried to move this to a separate class, but it just crashes, so I'll keep it here.
    LOG.debug "Enter setup_status_menu"
    statusbar = NSStatusBar.systemStatusBar
    status_item = statusbar.statusItemWithLength(NSVariableStatusItemLength)
    image_name = NSBundle.mainBundle.pathForResource_ofType('stretch', 'tiff')
    image = NSImage.alloc.initWithContentsOfFile(image_name)
    status_item.setImage(image)  # TODO: fix the image
    status_item.setTitle("TEST")

    menu = NSMenu.alloc.init
    status_item.setMenu(menu)

    # menu_item = menu.addItemWithTitle_action_keyEquivalent( "Empty inbox once", "empty_inbox_once:", '')
    # menu_item.setTarget(self) # TODO: Will with all probably be moved to another class & module

    menu_item = menu.addItemWithTitle_action_keyEquivalent( "Test", "test:", '')  # TEST
    menu_item.setTarget(self)

    menu_item = menu.addItemWithTitle_action_keyEquivalent( "Quit", "terminate:", '')
    #menu_item.setKeyEquivalentModifierMask(NSCommandKeyMask)
    menu_item.setTarget(NSApp)

    LOG.info("Added status menu")
  end

  # def empty_inbox_once(sender)
    # LOG.debug "Started by #{sender} choosing empty_inbox_once"

    # LOG.debug "Exits 'empty_inbox_once'"
  # end

  def test(sender)
    LOG.debug "Enters and exits test"
  end

end