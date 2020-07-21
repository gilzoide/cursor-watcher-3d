import * as THREE from 'three'

var scene = new THREE.Scene()
var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
var renderer = new THREE.WebGLRenderer()
renderer.setSize(window.innerWidth, window.innerHeight)

// Wall
{
	const geometry = new THREE.PlaneGeometry(500, 500)
	const material = new THREE.MeshBasicMaterial({ color: 0xffff00, side: THREE.DoubleSide })
	let wall = new THREE.Mesh(geometry, material)
	wall.position.set(0, 0, -100)
	scene.add(wall)
}
// Test cube
{
	const geometry = new THREE.BoxGeometry();
	const material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
	let cube = new THREE.Mesh( geometry, material );
	cube.rotation.set(1, 2, 3)
	scene.add( cube );
}

camera.position.z = 5;

document.body.appendChild(renderer.domElement)

function animate(): void {
	requestAnimationFrame(animate);
	renderer.render(scene, camera);
}
animate()