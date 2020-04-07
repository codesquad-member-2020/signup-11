const modal = document.getElementById('modal');
const modalBtn = document.getElementById('modalBtn');
const closeBtn = document.getElementsByClassName('closeBtn')[0];
const agreeBtn = document.getElementsByClassName('agree')[0];

modalBtn.addEventListener('click', openModal);
closeBtn.addEventListener('click', closeModal);
agreeBtn.addEventListener('click', closeModal);

function openModal() {
  modal.style.display = 'block';
}

function closeModal() {
  modal.style.display = 'none';
}