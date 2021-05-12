/*global ScrollReveal*/
document.addEventListener("turbolinks:load"
, function () {
  ScrollReveal().reveal('.scroll-left', {
    duration: 1600,// アニメーションの完了にかかる時間
    origin: 'left',
    distance: '150px',//表示された時に要素が移動する距離
    reset: false// 何回もアニメーション表示するか
  });
})

document.addEventListener("turbolinks:load"
, function () {
  ScrollReveal().reveal('.scroll-right', {
    duration: 1600,
    origin: 'right',
    distance: '150px',
    reset: false
  });
})

document.addEventListener("turbolinks:load"
, function () {
  ScrollReveal().reveal('.scroll-animation', {
  duration: 1600,
  scale: 0.1,//表示される前の要素のサイズ
  reset: false
  });
})