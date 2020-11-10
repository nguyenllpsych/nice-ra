# NICE Research Group Workspace - Research Assistant
Shared workspace for research assistants in the NICE research group who are supervised by Linh Nguyen.  


* Note on syntax: When available, please use the command lines exactly as indicated below. Whenever there is a squared bracket `<>`, you should put in the appropriate information there and NOT include the brackets themselves. When there is no command line provided, this means the action can be done by point-and-click on the Github page. As usual, please let me know immediately if there is any question or concern. We are using the [Forking Workflow](https://medium.com/dev-genius/git-forking-workflow-bbba0226d39c).

### Set-up -- To be done only once

1. Fork the repository to create a copy on your own Github account.

2. In your forked repository on Github, click on Code and copy the SSH link of the form `git@github.com:...`

3. In your terminal, navigate to your preferred location using `cd <file_path>`. 

4. Clone the repository to your machine using `git clone <SSH_link_from_2>`.  

5. In your terminal, navigate to the repository `cd nice-ra`.

6. Add the original repository as your upstream `git remote add upstream https://github.com/nguyenllpsych/nice-ra.git`.

  
### General workflow -- To be done every session

1. In your terminal, navigate to your repository (if not already there) and make sure you're on the main branch by `git branch -a`. It should look like: *main (in green). If you're on a different branch, switch to the main branch by `git checkout main`.

2. Pull from the main Github page to make sure your local repository is up to date by `git pull upstream main`.  

    2b. Push the update to your Github repository by `git push`. Check your Github repository on the browser and make sure it says "even with nguyenllpsych:main."

3. Create a new branch named as the current date in the format yyyymmdd, such as 20201109, `git branch <yyyymmdd>`.  

    3b. Switch to this branch by `git checkout <yyyymmdd>`.  

    3c. Make any edits and contributions to the files in your local machine.

4. When you're done with work for the day, commit your work by (1) `git add -A`, then (2) `git commit -m'<a_short_note_about_the_changes_made>'`.  

    4b. Make sure you have all the updated info from the original Github by `git pull upstream main`. Important to do before pushing (4c)

    4c. Push your work to your Github repository by `git push --set-upstream origin <branch_name_of_yyyymmdd>`.  

5. In your forked repository on Github, create a pull request and add the message explaining the edits made, of the form "yyyymmdd: edits", such as "20201109: added detailed instructions to the readme file".

6. You will receive an email that your pull request was accepted, i.e., the changes have been merged to the original Github. You can now delete the branch.  

    6b. Switch back to your main branch by `git checkout main`.   

    6c. Delete the temporary branch by `git branch -d <yyyymmdd>`.  

    6d. Delete the temporary branch on your Github by `git push origin --delete <yyyymmdd>`. 


