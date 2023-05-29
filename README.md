# quara_sunmi_printer


Introduction
SUNMI devices come with an inbuilt thermal printer, complete with a buffer, which allows applications to directly print thermal receipts via SDK.

The following SUNMI devices equipped with a printer include:

Mobile products: V1, V1s, V2 Pro, etc.
Smart payment products: P1, P14g, etc.
Desktop POS: T1, T2, T1 MINI, T2 MINI, etc.
POS scale: S2, etc.
There are two specifications of inbuilt printers for SUNMI devices:

Printers that support an 80mm paper width, equipped with a paper cutter, and are compatible with the 58mm spec. The T1 device is equipped with this specification of printer.

Printers that support a 58mm paper width, without a paper cutter. The V1 device is equipped with this specification of printer.

Application developers have three methods to interface with the inbuilt printer:

Print service interface: This method works best for developers who are not familiar with Epson commands and are developing apps related to printing for the first time. They can achieve the desired printing effects through multiple printing interfaces provided by SUNMI print service.

Inbuilt virtual Bluetooth device: This method works best for developers who have previously developed Bluetooth or USB printers, or the app being developed has already implemented Bluetooth printing. Developers can modify some codes and achieve the desired printing effects.

JS bridge on H5 Webpage: This method works best for the app accessing to an H5 webpage.
sunmi docs
https://file.cdn.sunmi.com/SUNMIDOCS/%E5%95%86%E7%B1%B3%E5%86%85%E7%BD%AE%E6%89%93%E5%8D%B0%E6%9C%BA%E5%BC%80%E5%8F%91%E8%80%85%E6%96%87%E6%A1%A3EN-0224.pdf
