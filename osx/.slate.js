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
  'u:ctrl,alt': alias.topleft,
  'i:ctrl,alt': alias.tophalf,
  'o:ctrl,alt': alias.topright,
  'j:ctrl,alt': alias.lefthalf,
  'k:ctrl,alt': alias.full,
  'l:ctrl,alt': alias.righthalf,
  'm:ctrl,alt': alias.bottomleft,
  ',:ctrl,alt': alias.bottomhalf,
  '.:ctrl,alt': alias.bottomright
});