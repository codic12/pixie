import chroma, pixie, pixie/fileformats/bmp

# block:
#   var image = newImage(4, 2)

#   image[0, 0] = rgba(0, 0, 255, 255)
#   image[1, 0] = rgba(0, 255, 0, 255)
#   image[2, 0] = rgba(255, 0, 0, 255)
#   image[3, 0] = rgba(255, 255, 255, 255)

#   image[0, 1] = rgba(0, 0, 255, 127)
#   image[1, 1] = rgba(0, 255, 0, 127)
#   image[2, 1] = rgba(255, 0, 0, 127)
#   image[3, 1] = rgba(255, 255, 255, 127)

#   writeFile("tests/fileformats/bmp/test4x2.bmp", encodeBmp(image))

#   var image2 = decodeBmp(encodeBmp(image))
#   doAssert image2.width == image.width
#   doAssert image2.height == image.height
#   doAssert image2.data == image.data

# block:
#   var image = newImage(16, 16)
#   image.fill(rgba(255, 0, 0, 127))
#   writeFile("tests/fileformats/bmp/test16x16.bmp", encodeBmp(image))

#   var image2 = decodeBmp(encodeBmp(image))
#   doAssert image2.width == image.width
#   doAssert image2.height == image.height
#   doAssert image2.data == image.data

block:
  for bits in [32, 24]:
    let image = decodeBmp(readFile(
      "tests/fileformats/bmp/knight." & $bits & ".master.bmp"
    ))
    writeFile("tests/fileformats/bmp/knight." & $bits & ".bmp", encodeBmp(image))
