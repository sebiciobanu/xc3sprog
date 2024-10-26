#ifndef __IO_GPIOD_PI__
#define __IO_GPIOD_PI__

#include "iobase.h"
#include <gpiod.h>

class IOGPIODPi : public IOBase
{
 public:
  IOGPIODPi(int tms, int tck, int tdi, int tdo);
  virtual ~IOGPIODPi();

 protected:
  void tx(bool tms, bool tdi);
  bool txrx(bool tms, bool tdi);

  void txrx_block(const unsigned char *tdi, unsigned char *tdo, int length, bool last);
  void tx_tms(unsigned char *pat, int length, int force);

  int TMSPin;
  int TCKPin;
  int TDIPin;
  int TDOPin;
  
  private:
    struct gpiod_chip *chip;
    struct gpiod_line *TMSline;
    struct gpiod_line *TCKline;
    struct gpiod_line *TDIline;
    struct gpiod_line *TDOline;
};

#endif