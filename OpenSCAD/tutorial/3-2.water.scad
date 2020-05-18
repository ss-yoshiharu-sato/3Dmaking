// union(){
// 	color("red") sphere(r=60);
// 	color("blue"){
// 		translate([95.84,0,0]) sphere(r=53);
// 		rotate([0,104.45,0]) translate([95.84,0,0]) sphere(r=53);
// 	}
// }

// union(){
// 	color("red") sphere(r=30);
// 	translate([0,0,95.84]) color("blue") sphere(r=30);
// 	color("yellow") cylinder(r=4,h=85.84);
// 	rotate([0,104.45,0]) {
// 		translate([0,0,95.84]) color("blue") sphere(r=30);
// 		color("yellow") cylinder(r=4,h=85.84);
// 	}
// }

o=[0,0,0]; //酸素原子の位置は原点
h1=[95.84,0,0]; //水素原子1の位置
h2=[95.84*cos(104.45),95.84*sin(104.45),0]; //水素原子2の位置
l1=[o,h1];
l2=[o,h2];

module atom(tr,r,c){
	translate(tr) color(c) sphere(r=r);
}

module link_cylinder(l, r, col) {
	s = l[0];
	e = l[1];
	vx = e[0]-s[0];
}

atom(o,30,"red"); //酸素配置
atom(h1,30,"blue"); //水素1配置
atom(h2,30,"blue"); //水素2配置

