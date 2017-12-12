const toParams = obj => Object.entries(obj).map(([key, val]) => `${key}=${encodeURIComponent(val)}`).join('&');

document.addEventListener('turbolinks:load', () => {
  const iframes = document.getElementsByClassName('jotform_iframe')
  const paramsObj = JSON.parse(document.getElementById('jotform_params').content.textContent)
  const paramsStr = toParams(paramsObj)
  Array.prototype.forEach.call(iframes, ifr => {
    if (ifr && paramsStr.length > 0) {
      ifr.src = ifr.src.indexOf('?') > -1 ? ifr.src + '&' + paramsStr : ifr.src + '?' + paramsStr
    }
  })
})

const handleIFrameMessage = function(e) {
  const args = e.data.split(':')
  const iframeId = args.length > 2 ? 'JotFormIFrame-' + args[2] : 'JotFormIFrame'
  const iframe = document.getElementById(iframeId)

  if (!iframe) return
  switch (args[0]) {
    case 'scrollIntoView':
      iframe.scrollIntoView()
      break
    case 'setHeight':
      iframe.style.height = args[1] + 'px'
      break
    case 'collapseErrorPage':
      if (iframe.clientHeight > window.innerHeight) {
        iframe.style.height = window.innerHeight + 'px'
      }
      break
    case 'reloadPage':
      window.location.reload()
      break
  }
  const isJotForm = e.origin.indexOf('jotform') > -1 ? true : false
  if (isJotForm && 'contentWindow' in iframe && 'postMessage' in iframe.contentWindow) {
    const urls = {
      docurl: encodeURIComponent(document.URL),
      referrer: encodeURIComponent(document.referrer),
    }
    const m = JSON.stringify({ type: 'urls', value: urls })
    iframe.contentWindow.postMessage(m, '*')
  }
}
document.addEventListener('message', handleIFrameMessage, false)
