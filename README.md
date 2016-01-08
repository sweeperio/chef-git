# git

[![Build Status](https://travis-ci.org/sweeperio/chef-git.svg?branch=master)](https://travis-ci.org/sweeperio/chef-git)

Install/configure git

## What This Does

* Installs git from source

## Attributes

| attribute | description | default |
|-----------|-------------|---------|
| `node["git"]["version"]` | the version to install | `"2.7.0"` |

## Recipes

### git::default

Build and install the version of git specified by `node["git"]["version"]`

**Usage:** add `recipe[git]` to your run list.

## Resources

### git_version

Build and install a version of git.

#### Properties

| property | description | value |
|----------|-------------|-------|
| version | the version to install | The name of the resource |

**Usage**

```ruby
# in a recipe or resource
git_version("2.7.0")
```


## License

The MIT License (MIT)

Copyright (c) 2016 sweeper.io

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
