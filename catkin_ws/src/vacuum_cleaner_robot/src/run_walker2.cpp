#include "Walker2.h"

int main(int argc, char **argv) {
    // Initiate new ROS node named "walker"
    ros::init(argc, argv, "walker2");

    // Create new stopper object
    Walker2 walker;

    // Start the movement
    walker.startMoving();

    return 0;
}
