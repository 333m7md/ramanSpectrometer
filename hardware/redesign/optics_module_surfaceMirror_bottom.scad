use <std_mechanical_object_flange.scad>

module mirror(){
	translate ([1.75,1.75,0]) rotate([0,90,45]) cylinder(r=13,h=5,$fn=100,center=true);
}

module mirrorAssembly_bottom(){
	//flanges
	rotate([0,180,0]){
		translate([7,0,0]){
			union(){
				difference(){
					flange();
					cube(size=[10,30,30],center=true);
				}
				flangeFace();
			}
		}
	}
	rotate([0,0,270]){
		translate([7,0,0]){
			union(){
				difference(){
					flange();
					cube(size=[10,30,30],center=true);
				}
				flangeFace();
			}
		}
	}
	//screwHole
	difference(){
		translate([-15,-15,0]) cube(size=[10,10,7],center=true);
		translate([-15,-15,0]) cylinder(r=1.25,h=8,center=true);
	}
	//mirrorObject
/*	rotate([0,0,45]){
		mirror();
	}	*/
}

module mirrorSphere_bottom(){
	difference(){
		//outerSphere
		sphere(r=17,center=true);
		//innerSphere
		sphere(r=10,center=true);
		//mirrorSlot
		translate ([1.75,1.75,0]) rotate([0,90,45]) cylinder(r=14,h=6,$fn=100,center=true);
		//laserPathCutouts
		translate([-10,0,0]) rotate([0,90,0]) cylinder(r=10,h=20,center=true);
		translate([0,-10,0]) rotate([0,90,90]) cylinder(r=10,h=20,center=true);
		//flatTops
		translate([0,0,20]) cube(size=[20,20,10],center=true);
		translate([0,0,-20]) cube(size=[20,20,10],center=true);
		//screwHoles
		translate([0,13.5,0]) cylinder(r=1.25,h=10,center=true);
		translate([13.5,0,0]) cylinder(r=1.25,h=10,center=true);

	}
}

module mirror_mount_bottom(){
	difference(){
		union(){
			mirrorSphere_bottom();
			mirrorAssembly_bottom();
		}
		//topChop
		translate([0,0,11]) cube(size=[50,50,22],center=true);
	}
}

mirror_mount_bottom();
//translate([-3.5,0,0]) cube(size=[35,1,1],center=true);
