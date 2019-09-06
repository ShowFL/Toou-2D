####################################
#   Toou-2D
# http://2d.toou.net
####################################

TEMPLATE = subdirs

SUBDIRS += \
    src-toou2d/Toou2D.pro \
    example

    example.depends = src-toou2d/Toou2D.pro
