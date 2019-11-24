public class dragdrop extends AppCompatActivity {

    Button b1;
    TextView t1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dragdrop);
        b1=(Button)findViewById(R.id.b1);
        t1=(TextView)findViewById(R.id.t1);

        t1.setOnLongClickListener(lcl);
        b1.setOnDragListener(dsl);

    }

    View.OnLongClickListener lcl=new View.OnLongClickListener()

    {
        @Override
        public boolean onLongClick(View view)
        {

            ClipData data=ClipData.newPlainText("","");
            View.DragShadowBuilder mysh=new View.DragShadowBuilder(view);
            view.startDrag(data,mysh,view,0);
            return true;
        }
    };

    View.OnDragListener dsl=new View.OnDragListener() {
        @Override
        public boolean onDrag(View view, DragEvent dragEvent)

        {
            int d=dragEvent.getAction();
            final View view1=(View)dragEvent.getLocalState();
            switch(d)
            {
                case DragEvent.ACTION_DRAG_STARTED:
                    b1.setText("Drag Started");
                    break;
                case DragEvent.ACTION_DRAG_ENTERED:
                    b1.setText("Drag Entered");
                    break;
                case DragEvent.ACTION_DRAG_ENDED:
                    b1.setText("Drag ENDED");
                    break;

                case DragEvent.ACTION_DRAG_EXITED:
                    b1.setText("Drag Exited");
                    break;

                default:

            }
            return true;
        }
    };
    }

============================================================
    private void DrawCircle(LatLng p)
    {
        CircleOptions c = new CircleOptions();
        c.center(p);
        c.radius(70);
        c.strokeColor(0x500000A0);
        c.fillColor(0x402B60DE);
        c.strokeWidth(10);
        mMap.addCircle(c);

    }
===============================================================

        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                PopupMenu popup = new PopupMenu(MainActivity.this, button);
                popup.getMenuInflater().inflate(R.menu.menu, popup.getMenu());
                popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                    public boolean onMenuItemClick(MenuItem item) {
                        Toast.makeText(MainActivity.this,"You Clicked : " + item.getTitle(), Toast.LENGTH_SHORT).show();
                        return true;
                    }
                });

                popup.show();
            }
        });
===============================================================
<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item
        android:id="@+id/one"
        android:title="One" />
    <item
        android:id="@+id/two"
        android:title="Two"/>
    <item
        android:id="@+id/three"
        android:title="Three"/>
</menu>  
