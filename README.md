## granite-css-modularizer

`granite-css-modularizer` is a small node script to generate Polymer style modules from CSS files.

### Generating the style modules

#### 1. Clone the repository and recover the dependencies of `granite-css-modularizer`

Clone the [granite-css-modularizer](https://github.com/LostInBrittany/granite-css-modularizer) repository and recover the dependencies using `yarn` (or `npm`) :

```
$ yarn install
yarn install v1.2.1
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
[4/4] Building fresh packages...
success Saved lockfile.
Done in 0.83s.
```

#### 2. Recover a lib with CSS to modularize (e.g. Bootstrap) 

For olur Bootstrap example, recover Bootstrap distribution using `yarn` (or `npm`):

```
$ yarn add bootstrap@4.0.0-beta.2
yarn add v1.2.1
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...
[3/4] Linking dependencies...
warning "bootstrap@4.0.0-beta.2" has unmet peer dependency "jquery@1.9.1 - 3".
warning "bootstrap@4.0.0-beta.2" has unmet peer dependency "popper.js@^1.12.3".
[4/4] Building fresh packages...
success Saved lockfile.
success Saved 1 new dependency.
└─ bootstrap@4.0.0-beta.2
Done in 0.55s.
```

Currently *granite-bootstrap* uses Bootstrap version 4.0.0-beta.2, if you need another version you can change simply install it.


#### 3. Generate the components 

Using NodeJS and the `granite-css-modularizer.js` to transform the library's CSS files into polymer elements.

In our Bootstrap example, CSS are in `dist/css` folder in the Bootstrap module, so we can do:

```
$ node ../granite-css-modularizer.js ./node_modules/bootstrap/dist/css ./css_modules/granite-bootstrap
```

After executing it, a series of HTML files is generated in the `./css_modules/granite-bootstrap` folder, each one corresponding to a Bootstrap CSS file.

```
$ ls ./css_modules/granite-bootstrap/*.html
granite-bootstrap-grid.html  granite-bootstrap-grid-min.html  granite-bootstrap.html  granite-bootstrap-min.html  granite-bootstrap-reboot.html  granite-bootstrap-reboot-min.html
```


### Using the modules modules

Using  polymer [shared styles](https://www.polymer-project.org/1.0/docs/devguide/styling.html#style-modules) modules is a two-step process: you need to use a `<link>` tag to import the module, and a `<style>` tag to include the styles in the correct place.

We are yet taking as example *granite-bootstrap*, the modulized styles versions of Bootstrap. To use *granite-bootstrap* in an element:

#### 1. Add the dependency

Add the dependency to the `bower.json` of your application:

```
   "dependencies": {
     [...]
     "granite-bootstrap": "LostInBrittany/granite-bootstrap#^4.0.2-beta.2"
   }
``` 

And then recover them via `bower install`.


#### 2. Import the *granite-bootstrap* module you want to use

Usually you will simply want to import `granite-bootstrap.html` (wrap around `bootstrap.css`) or `granite-bootstrap-min.html`
(wrap around `bootstrap.min.css`).

Supossing you're using the standard folder locations for your components:
 
```
<link rel="import" href="../granite-bootstrap/granite-bootstrap.html">
``` 

#### 3. Inside your component, use *granite-bootstrap* as shared style

In your element's template you add the include for the *granite-bootstrap* module:

```
<style include="granite-bootstrap"></style>
```
 

#### A complete example

```
<!-- import the module  -->
<link rel="import" href="../granite-bootstrap/granite-bootstrap.html">
<dom-module id="x-foo">
  <template>
    <!-- include the style module by name -->
    <style include="granite-bootstrap"></style>
    <style>:host { display: block; }</style>
    Hi
  </template>
  <script>Polymer({is: 'x-foo'});</script>
</dom-module>
```
 



### Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

### Note on semver versioning

I'm aligning the versions of this element with Bootstrap version, in order to make easier to choose the right version
 
### License

[Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0)
