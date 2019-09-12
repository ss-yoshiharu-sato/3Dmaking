//linear_extrude(height = 3, center = false, convexity = 5, twist = 530, $fn = 20)
//translate([1, 1, 0])
//circle(r = 1);

// rotate_extrude(convexity = 10)
// translate([2, 0, 0])
// circle(r = 1, $fn = 100);

// function drop(t) = 100 * 0.5 * (1 - cos(180 * t)) * sin(180 * t) + 1;
// function path(t) = [0, 0, 80 + 80 * cos(180 * t)];
// function rotate(t) = PI * pow((1 - t), 3);

// loft(path="path", scale_x = "drop", scale_y="drop", rotate="rotate", slices=100) circle(r = 1, $fn = 12);
hull(){
	translate([0, 0, 0]) rotate([0, 0, 0]) cylinder(h=0.1, r=10, center=false, $fn=20);
	translate([0, 5, 5]) rotate([0, 20, 0]) cylinder(h=0.1, r=8, center=false, $fn=20);
	translate([0, 4, 10]) rotate([0, 40, 0]) cylinder(h=0.1, r=6, center=false, $fn=20);
}