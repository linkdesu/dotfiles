/**
 * Global variables:
 * S is short for slate
 * _ is short for underscore
 */
var alias;

S.configAll({
  defaultToCurrentScreen: true,
  nudgePercentOf: 'screenSize',
  resizePercentOf: 'screenSize'
});

alias = {
  full: S.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX',
    height: 'screenSizeY'
  }),
  lefthalf: S.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
  }),
  righthalf: S.op('move', {
    x: 'screenOriginX+screenSizeX/2',
    y: 'screenOriginY',
    width: 'screenSizeX/2',
    height: 'screenSizeY'
  }),
  tophalf: S.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY',
    width: 'screenSizeX',
    height: 'screenSizeY/2'
  }),
  bottomhalf: S.op('move', {
    x: 'screenOriginX',
    y: 'screenOriginY+screenSizeY/2',
    width: 'screenSizeX',
    height: 'screenSizeY/2'
  }),
  topleft: S.op('corner', {
    direction: 'top-left',
    width: 'screenSizeX/2',
    height: 'screenSizeY/2'
  }),
  topright: S.op('corner', {
    direction: 'top-right',
    width: 'screenSizeX/2',
    height: 'screenSizeY/2'
  }),
  bottomleft: S.op('corner', {
    direction: 'bottom-left',
    width: 'screenSizeX/2',
    height: 'screenSizeY/2'
  }),
  bottomright: S.op('corner', {
    direction: 'bottom-right',
    width: 'screenSizeX/2',
    height: 'screenSizeY/2'
  })
};

S.bindAll({
  'k:ctrl,alt': alias.full,
  'j:ctrl,alt': alias.lefthalf,
  ',:ctrl,alt': alias.bottomhalf,
  'i:ctrl,alt': alias.tophalf,
  'l:ctrl,alt': alias.righthalf,
  'n:ctrl,alt': alias.bottomleft,
  'u:ctrl,alt': alias.topleft,
  '.:ctrl,alt': alias.bottomright,
  'o:ctrl,alt': alias.topright
});