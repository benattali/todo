const done = () => {
	const done = document.querySelectorAll(".done");
	done.forEach((task) => {
		task.addEventListener("click", (event) => {
			console.log(event);
		});
	});
}

export { done };