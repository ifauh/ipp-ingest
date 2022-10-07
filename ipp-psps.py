import fitsio
from fitsio import FITS,FITSHDR
from astropy.table import Table
from astropy.io import ascii
import argparse
import os


parser = argparse.ArgumentParser()
parser.add_argument("fits_file", help="Extract csv files from the specified FITS file")
args = parser.parse_args()

fitsFile=args.fits_file
fitsPath=os.path.dirname(fitsFile)
fitsFile=os.path.basename(fitsFile)
batchID=fitsFile.split('.')[0]

fits,fitsheader = fitsio.read(args.fits_file, header=True)
print(fitsheader)

# 1 is the frame metadata, all images from this frame, 60 images
# next 2 are image metadata (concatenate)
# next is a list of the object detections in the image
# next 2 are next image metadata (concatenate)
# next is a list of the object detections in the image
# ...
for t in range(fitsheader['NTABLE']):
  dat=Table.read(args.fits_file, format='fits', hdu=t+1)
  print(dat)
  csvname='%s-%d.csv'%(batchID, t+1)
  ascii.write(dat, csvname, format='csv')

