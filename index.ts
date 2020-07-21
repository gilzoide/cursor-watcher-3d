import * as THREE from 'three'

var canvas = document.querySelector('#scene') as HTMLCanvasElement

var scene = new THREE.Scene()
var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
camera.position.z = 5;
var renderer = new THREE.WebGLRenderer({ canvas })
renderer.setSize(window.innerWidth, window.innerHeight)

// Wall
{
	const geometry = new THREE.PlaneGeometry(500, 500)
	const material = new THREE.MeshStandardMaterial({ color: 0xffff00, side: THREE.DoubleSide })
	var wall = new THREE.Mesh(geometry, material)
	wall.position.set(0, 0, -10)
	scene.add(wall)
}
// Test cube
{
	const geometry = new THREE.BoxGeometry();
	const material = new THREE.MeshStandardMaterial( { color: 0x00ff00 } );
	var cube = new THREE.Mesh( geometry, material );
	cube.rotation.set(1, 2, 3)
	scene.add(cube);
}
// Light
{
	var directionalLight = new THREE.DirectionalLight()
	directionalLight.position.copy(camera.position)
	directionalLight.target = wall
	scene.add(directionalLight)

	var spotLight = new THREE.SpotLight('white', 1, 15)
	spotLight.target = wall
	spotLight.position.set(0, 0, 1)
	spotLight.visible = false
	scene.add(spotLight)
}

document.body.appendChild(renderer.domElement)

function animate(): void {
	requestAnimationFrame(animate);
	renderer.render(scene, camera);
}
animate()

window['toggleLights'] = function toggleLights(): void {
	directionalLight.visible = !directionalLight.visible
	spotLight.visible = !spotLight.visible
}

toggleLights()