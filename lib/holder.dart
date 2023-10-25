/*TextField(
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: showOptions,
                ),
              ),
            ),


void showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('Male'),
              onTap: () {
                setState(
                  () {
                    selectedOption = 'Male';
                  },
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () {
                setState(() {
                  selectedOption = 'Female';
                });
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }*/