import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    home: AlertDialogDemo(),
  ));
}

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({super.key});

  /// Alert : Simple, Confirmation, Custom
  /// Bottom Sheet
  /// Snackbar
  /// Dialog: Simple, Custom, Full screen
  

  // Simple Alert 
  void _showSimpleAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Simple Alert"),
        content: const Text("This is a simple alert message."),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("OK"))
        ],
      );
    },);
  }

  // Confirmation Alert
  void _showConfirmationAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Are you sure you want to proceed?"),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("No")
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("Yes")
          ),
        ],
      );
    },);
  }

  // Custom Alert
  void _showCustomAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: const Text("Custom Alert"),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text("Enter your name:"),
          TextField(),
        ],),
        actions: [
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("Cancel")
          ),
          TextButton(onPressed: () {
            Navigator.of(context).pop();
          }, child: const Text("Sumbit")
          ),
        ],
      );
    },);
  }

  // Bottom Sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        height: 200,
        child: Center(
          child: Column(children: [
            const Text("Bottom Sheet Alert", style: TextStyle(fontSize: 25),),
            const SizedBox(height: 15,),
            const Text("This is a bottom sheet alert."),
            const SizedBox(height: 35,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text("Close")
            )
          ],),
        ),
      );
    },);
  }

  // Snackbar
  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("This is a snackbar message"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(label: "RETRY", onPressed: () {
          // handle retry action
        }),
      ),
    );
  }

  // Simple Dialog
  void _showSimpleDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: const Text("Choose your device brand:"),
        children: [
          SimpleDialogOption(onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("iPhone"),
          ),
          SimpleDialogOption(onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Samsung"),
          ),
          SimpleDialogOption(onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Motorolla"),
          ),
          SimpleDialogOption(onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("One Plus"),
          ),
        ],
      );
    },);
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return Dialog(
        // shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(15.0)
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Custom Dialog", style: TextStyle(fontSize: 25),),
            const SizedBox(height: 15,),
            const TextField(
              decoration: InputDecoration(hintText: "Enter some text"),
            ),
            const SizedBox(height: 35,),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: const Text("Close")
            ),
          ],
        ),
      );
    },);
  }

  void _showFullScreenDialog(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const FullScreenDialog(),
      fullscreenDialog: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert Dialog Demo"),),
      body: Center(
        child: Column(
          children: [
            // Simple Alert
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _showSimpleAlertDialog(context), 
                child: const Text("Show Simple Alert")
              ),
            ),

            // Confirmation Alert
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => _showConfirmationAlertDialog(context),
                child: const Text("Show Confirmation Alert")
               ),
            ),

             // Custom Alert
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                onPressed: () => _showCustomAlertDialog(context), 
                child: const Text("Show Custom Alert")
               ),
             ),

             //Bottom Sheet
             ElevatedButton(
              onPressed: () => _showBottomSheet(context), 
              child: const Text("Show Bottom Sheet")
             ),

             // Snackbar
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                onPressed: () => _showSnackbar(context), 
                child: const Text("Show Snackbar")
               ),
             ),

             // Simple Dialog
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: ElevatedButton(
                onPressed: () => _showSimpleDialog(context), 
                child: const Text("Show Simple Dialog")
                ),
             ),

              // Custom Dialog
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () => _showCustomDialog(context), 
                child: const Text("Show Custom Dialog")
                ),
              ),

              // Full Screen Dialog
              ElevatedButton(onPressed: () => _showFullScreenDialog(context), 
              child: const Text("Show Full-Screen Dialog"),
              ),
              
          ],
        ),
      ),
    );
  }
  
}

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Screen Dialog"),
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.close)),
      ),
      body: const Center(
        child: Text("This is a full screen dialog."),
      ),
    );
  }

}