const done = () => {
	const done = document.querySelector(".done");
	console.log(done.innerText);
	const status = document.querySelector(".status");
	console.log(status.innerText);
	done.addEventListener("click", (event) => {
		status.innerText = "[x] <%= task.description %>";
	});
}

export { done };