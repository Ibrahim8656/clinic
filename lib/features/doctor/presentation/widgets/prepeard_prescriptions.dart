import 'package:clinic/core/colos/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class prepeared_prescriptons extends StatelessWidget {
  const prepeared_prescriptons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .25,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1,color: const Color.fromARGB(255, 184, 184, 184))
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6, // Number of columns
            crossAxisSpacing: 10, // Horizontal space between items
            mainAxisSpacing: 20, // Vertical space between items
            childAspectRatio: 4,
          ),
          itemCount: 20, // Number of items in the grid
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: primarycolor,
    
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
