const toParams = obj =>
  Object.entries(obj)
    .map(([key, val]) => `${key}=${encodeURIComponent(val)}`)
    .join('&')

const closeModal = () => {
  const offerModal = document.getElementById('offer-modal')
  offerModal.classList.remove('is-active')
}

const addJotFormParams = extraParams => {
  const iframes = document.getElementsByClassName('jotform_iframe')
  const jotformParamElement = document.getElementById('jotform_params')
  const paramsObj = jotformParamElement ? JSON.parse(jotformParamElement.content.textContent) : {}
  const paramsStr = toParams(Object.assign({}, paramsObj, extraParams))
  Array.prototype.forEach.call(iframes, ifr => {
    if (ifr && paramsStr.length > 0) {
      ifr.src = ifr.src.indexOf('?') > -1 ? ifr.src + '&' + paramsStr : ifr.src + '?' + paramsStr
    }
  })
}

const showForm = extraParams => {
  const supplierSelectForm = document.getElementById('supplier-select-form')
  const template = document.getElementById('jotform_iframe_template')
  const modalContent = supplierSelectForm.parentNode.parentNode
  modalContent.innerHTML = ''
  modalContent.appendChild(template.content)
  addJotFormParams(extraParams)
}

document.addEventListener('turbolinks:load', () => {
  const supplierSelectForm = document.getElementById('supplier-select-form')
  if (supplierSelectForm) {
    supplierSelectForm.addEventListener('submit', evt => {
      evt.preventDefault()
      const supplierId = document.getElementById('supplier-select').value
      showForm({ supplier_id: supplierId })
    })
  }

  const offerButton = document.getElementById('offer-button')
  if (offerButton) {
    offerButton.addEventListener('click', () => {
      const offerModal = document.getElementById('offer-modal')
      offerModal.classList.add('is-active')
    })
  }

  Array.prototype.forEach.call(document.getElementsByClassName('modal-close'), closeButton => {
    closeButton.addEventListener('click', closeModal)
  })
  Array.prototype.forEach.call(document.getElementsByClassName('close'), closeButton => {
    closeButton.addEventListener('click', closeModal)
  })
})

document.addEventListener('keydown', evt => {
  evt = evt || window.event
  var isEscape = false
  if ('key' in evt) {
    isEscape = evt.key == 'Escape' || evt.key == 'Esc'
  } else {
    isEscape = evt.keyCode == 27
  }
  if (isEscape) {
    closeModal()
  }
})
