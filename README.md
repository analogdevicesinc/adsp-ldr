# ADSP LDR

ADSP LDR is a tool developed by Analog Devices, Inc. (ADI) to generate boot
stream images (i.e. `.ldr`) that can be parsed and executed by the boot ROM on
the ADSP-SCxxx DSP SoCs, including the ARM Cortex and ADI SHARC cores.

This implementation was originally extracted from CrossCore Embedded Studio,
which is an IDE/SDK that can be used to develop baremetal applications for the
ADSP processors.

## Getting Started

```
sudo apt-get install -y libusb-1.0-0-dev
pip install meson
meson setup builddir
cd builddir
meson compile
meson test
```

## Documentation

See the _Boot Loader Stream_ section in the
[ADSP-SC596/ADSP-SC598 SHARC+ Processor Hardware
Reference](https://www.analog.com/media/en/dsp-documentation/processor-manuals/adsp-sc595-sc596-sc598-hrm.pdf)
