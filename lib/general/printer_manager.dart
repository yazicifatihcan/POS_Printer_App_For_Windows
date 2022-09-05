import 'package:pos_printer_manager/pos_printer_manager.dart';

class CustomUsbPrinterManager {
  late final CapabilityProfile profile;
  late final Generator generator;

  static final CustomUsbPrinterManager _instance = CustomUsbPrinterManager._init();

  static CustomUsbPrinterManager get instance => _instance;

  CustomUsbPrinterManager._init();

  CustomUsbPrinterManager();

//We need to call this function when the app starting to initialize the values.
  Future<void> init() async {
    profile = await CapabilityProfile.load();
    instance.generator = Generator(PaperSize.mm80, instance.profile);
    await CapabilityProfile.ensureProfileLoaded();
  }

//Function that returns a list of defined printers in PC
  Future<List<USBPrinter>> discoverPrinterList() async {
    return await USBPrinterManager.discover();
  }

//Function that we print the paper by using bytes.
  Future<void> printPaper(USBPrinter usbPrinter, List<int> byte) async {
    USBPrinterManager manager = USBPrinterManager(usbPrinter, PaperSize.mm80, profile);
    await manager.writeBytes(byte);
  }
}
