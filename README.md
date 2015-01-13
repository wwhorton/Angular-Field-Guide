# Chesapeake Bay Program Field Guide

The standalone, responsive, mobile-first Field Guide site. 

Currently (1/13) the Master branch contains a fully-working albeit unpolished version of the site. If you want to see the site, **clone** it into a "www" or equivalent directory in a WAMP install or webserver. To work on the site, you'll need to install some Javascript tools, which I'll list below.

In order to keep from borking the working copy or overwriting each other's work, I'd request that you create your own local branch before making any changes. **Commit** any changes as you make them so they don't get lost. When you're ready to **push** to the repo, first **checkout** the master branch from the repo then **merge** your local development branch. That way, if more than one person happens to be working on the same thing (unlikely, I know) at the same time, git will merge the changes (or yell at you to resolve conflicts) and nobody's work gets lost. It's good practice anyway, and it's really easy once you get in the habit of doing it. 

##Notes

- I'm following the standard directory structure: templates are in system/expressionengine/templates/default_site/ . Currently, all resources are stored in subdirectories of www, e.g. uploaded critter photos are in /images/Entry Images. Custom js will be in /js, but vendor js will be in a separate directory (more on that below).

- __Don't edit the CSS directly.__ If you want to change styling, edit the appropriate Sass files (_appstyles.scss for custom stuff or _settings.scss to change Foundation settings). We're using Sass because it's awesome, and because Foundation uses a lot of Sass variables to make changing settings easier. Grunt (more on that below) watches the scss directory and compiles the css whenever it changes automatically, so any changes to the CSS file will get overwritten.

- [Grunt](http://gruntjs.com/) is a Javascript task-runner. We're using it to monitor the Sass and will probably use it for other fun stuf TBD. Basically, if you're going to mess with Sass, open a console window in www and type 'grunt'. 

## Installing JavaScript stuff!

If you're going to do any work on this you'll need the following things:

- [Node](http://nodejs.org/)

- [Bower](http://bower.io/) Install by typing:
    npm install -g bower
at the command prompt.

- node-sass

- Grunt

Now, you should only need to install Node and Bower by hand. Subsequently, typing "npm install" and "bower install" will automatically grab all the other stuff you need without your having to do anything, which is, of course, the point. If that goes haywire, which it very well may, let me know and I'll help.

