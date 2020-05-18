// color("red", .2) cube(10, center=true);
// translate([5, 5, 5])
// color([0, 0, 1.0, .4]) cube(10, center=true);

difference(){
	intersection(){
		cube(10, center=true);
		rotate([0,0,0]) cylinder(h=11,r=6.7,center=true,$fn=128);
		rotate([0,90,0]) cylinder(h=11,r=6.7,center=true,$fn=128);
		rotate([90,0,0]) cylinder(h=11,r=6.7,center=true,$fn=128);
	}

	translate([0,0,9.3]) sphere(5,$fn=32);
	translate([0,0,-9.9]) grid_hole(6);
	translate([0,9.9,0]) rotate([90,0,0]) grid_hole(4);
	translate([0,-9.9,0]) rotate([90,0,0]) grid_hole(3);
	translate([9.9,0,0]) rotate([0,90,0]) grid_hole(5);
	translate([-9.9,0,0]) rotate([0,90,0]) grid_hole(2);
	// translate([8,8,0])rotate([0,0,45]) #color("blue")cube(11,center=true);//#=highlight
	// edge_cutter([[8,8,0],[8,-8,0],[-8,-8,0],[-8,8,0]], [0,0,45]);
	// edge_cutter([[0,8,8],[0,-8,8],[0,-8,-8],[0,8,-8]], [45,0,0]);
	// edge_cutter([[8,0,8],[-8,0,8],[-8,0,-8],[8,0,-8]], [0,45,0]);
}

module grid_hole(n) {
	module myShape() {
		sphere(r=5,$fn=32);
	}
	translate([-3,3,0]) myShape();
	translate([3,-3,0]) myShape();
	if (n==3 || n==5) myShape();
	if (4<=n && n<=6){
		translate([-3,-3,0]) myShape();
		translate([3,3,0]) myShape();
	}
	if (n==6){
		translate([3,0,0]) myShape();
		translate([-3,0,0]) myShape();
	}
}


module edge_cutter(trs, rot) {
	for(t=trs){
		translate(t) rotate(rot)
		color("blue") cube(11, center=true);
	}
}

// intersection(){
// 	color("red") cube(10, center=true);
// 	// %cylinder(h=11,r=6.5,center=true,$fn=128);//%=transparent
// 	rotate([0,0,0]) cylinder(h=11,r=6.5,center=true,$fn=128);
// 	rotate([90,0,0]) cylinder(h=11,r=6.5,center=true,$fn=128);
// 	rotate([0,90,0]) cylinder(h=11,r=6.5,center=true,$fn=128);
// }