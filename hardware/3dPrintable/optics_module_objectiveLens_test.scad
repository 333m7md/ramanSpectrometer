use <std_mechanical_object_flange3.scad>

module objectiveMount(){
	union(){
		difference(){
			translate([-15.5,-4,0]) screwHoleOuter();
			translate([-15.5,-4,0]) screwHoleInner();
		}
		difference(){
			translate([15.5,-4,0]) screwHoleOuter();
			translate([15.5,-4,0]) screwHoleInner();
		}
		difference(){
			//mainBody
			intersection(){
				translate([0,3,0]) color([0,.6,.5]) cube(size=[30,30,25],center=true);
				translate([0,3,0]) rotate([90,0,0]) cylinder(r=18,h=35,center=true);
			}
			translate([-15,-4,0]) screwHoleInner();
			translate([15,-4,0]) screwHoleInner();
			//lensHole
			union(){
				translate([0,8,0]) rotate([90,0,0]) cylinder(h=11.5,r=12.25,center=true);
				translate([0,-6,0]) rotate([90,0,0]) cylinder(h=18,r=10.25,center=true);
				translate([0,15,0]) rotate([90,0,0]) cylinder(h=4.5,r=10.5,center=true);
			}
			intersection(){
				translate([0,14,0]) cube(size=[20,10,15],center=true);
				translate([0,15,0]) rotate([90,0,0]) cylinder(r=10,h=10,center=true);
			}
		}
		topFrontScrewMount();
		bottomFrontScrewMount();
	}
}
module objectiveTube(){
	union(){
		translate([0,73.5,0]){
			rotate([0,0,90]){
				flange();
			}
		}
		intersection(){
			union(){
				difference(){
					translate([0,48,0]) cube(size=[30,60,20],center=true);
					union(){
						intersection(){
							translate([0,48,0]) cube(size=[28,61,10],center=true);
							translate([0,48,0]) rotate([90,0,0]) cylinder(r=7,h=62,center=true);
						}
						translate([0,48,0]) rotate([0,0,0]) cube(size=[27.5,40,14],center=true);
					}
					//mainScrewHoles
					translate([-12,70,0]) screwHoleInner();
					translate([12,70,0]) screwHoleInner();
					translate([-12,25,0]) screwHoleInner();
					translate([12,25,0]) screwHoleInner();
				}
			}
			translate([0,48,0]) rotate([90,0,0]) cylinder(r=15,h=62,center=true);
		}
		difference(){
			translate([-12,70,0])  screwHoleOuter();
			translate([-12,70,0])  screwHoleInner();
		}
		difference(){
			translate([12,70,0]) screwHoleOuter();
			translate([12,70,0]) screwHoleInner();
		}
		difference(){
			translate([-12,25,0]) screwHoleOuter();
			translate([-12,25,0]) screwHoleInner();
		}
		difference(){
			translate([12,25,0]) screwHoleOuter();
			translate([12,25,0]) screwHoleInner();
		}
		topRearScrewMount();
		bottomRearScrewMount();
	}
}

module topFrontScrewMount(){
	union(){
		rotate([0,90,0]){
			difference(){
				translate([-17,8,0]) screwHoleOuter();
				translate([-17,8,0]) screwHoleInner2();
			}
		}
		translate([0,8,13]){
			intersection(){
				color([0,0.7,0.4]) cube(size=[15,15,2],center=true);
				translate([0,0,-12.5]){
					color([0,0.7,1]) sphere(r=15,center=true);
				}
			}
		}
	}
}
module bottomFrontScrewMount(){
	union(){
		rotate([0,90,0]){
			difference(){
				translate([17,8,0]) screwHoleOuter();
				translate([17.5,8,0]) screwHoleInner2();
			}	
		}
		translate([0,8,-13]){
			intersection(){
				color([0,0.7,0.4]) cube(size=[15,15,2],center=true);
				translate([0,0,12.5]){
					color([0,0.7,1]) sphere(r=15,center=true);
				}
			}
		}
	}
}
module  topRearScrewMount(){
	union(){
		rotate([0,90,0]){
			difference(){
				translate([-13,58,0]) screwHoleOuter();
				translate([-13,58,0]) screwHoleInner2();
			}		
		}
	}
}
module bottomRearScrewMount(){
	union(){
		rotate([0,90,0]){
			difference(){
				translate([13,58,0]) screwHoleOuter();
				translate([13,58,0]) screwHoleInner2();
			}
		}
	}
}
module screwHoleInner(){
	union(){
		translate([0,0,5]) cylinder(r=1.5,h=15,center=true);
		translate([0,0,11]) cylinder(r=3,h=15,center=true);
	}
}
module screwHoleInner2(){
	union(){
		translate([0,0,5]) cylinder(r=1.5,h=35,center=true);
		translate([0,0,11]) cylinder(r=3,h=15,center=true);
	}
}
module screwHoleOuter(){
		cylinder(r=5,h=15,center=true);
}


difference(){
	union(){
		objectiveTube();
		objectiveMount();
	}
		//chopBottom
		translate([0,30,-15]) cube([100,150,30],center=true);
}