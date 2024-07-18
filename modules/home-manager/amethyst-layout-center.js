function layout() {
    return {
        name: "Center",
        getFrameAssignments: (windows, screenFrame) => {
            const widthMuliplier = 0.6;
            const heightMultiplier = 0.96;

            frame = {
                x: screenFrame.x + screenFrame.width * (1 - widthMuliplier) / 2,
                y: screenFrame.y + screenFrame.height * (1 - heightMultiplier) / 2,
                width: screenFrame.width * widthMuliplier,
                height: screenFrame.height * heightMultiplier,
                disableWindowMargins: true,
            };

            return windows.reduce((frames, w) => ({ ...frames, [w.id]: frame }), {});
        }
    };
}
