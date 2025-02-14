// ignore_for_file: prefer_const_constructors, file_names, sized_box_for_whitespace

import "package:flutter/material.dart";

class DialogProfileWrapp extends StatefulWidget {
  final void Function()? plutardFunction;
  final void Function()? maintenantFunction;
  const DialogProfileWrapp(
      {Key? key, this.plutardFunction, this.maintenantFunction})
      : super(key: key);

  @override
  _DialogProfileWrappState createState() => _DialogProfileWrappState();
}

class _DialogProfileWrappState extends State<DialogProfileWrapp>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Tween<Offset>? pos;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    pos = Tween<Offset>(begin: Offset(0, -0.08), end: Offset.zero);

    if (mounted) {
      animationController!.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: pos!.animate(animationController!),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(0.8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Text(
                        "Inscription Effectué",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Voulez-vous remplir votre profile ou vous le ferez plutard ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    TextButton(
                      onPressed: widget.plutardFunction,
                      child: Text(
                        "Non, Plûtard!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.maintenantFunction,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "Remplir maintenant",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: -20,
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
