# Troubleshooting

## Tensorflow

- 14 June, 2018
    - `pip install tensorflow` will install the latest version of tensorflow by default.
      There may be bugs. So, use a lower version of tf. Install by 
      `pip install tensorflow==1.5`

## Installing Ubuntu on Ubuntu machine
You may see something like the following error

```
Missing parameter in configuration file 
gfxboot.c32: not a COM32R image
boot:
```

If you hit `tab`, you can see the available options.
You should see `live-install` as one of the options.
**Type** `live-install` and hit the `return` key.
Your Ubuntu installation should then start.

