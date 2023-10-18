<!-- Connection ✅ -->
<!-- select sediaan ✅-->
<!-- insert sediaan ✅-->
<!-- Update sediaan ✅ -->
<!-- Delete sediaan ✅-->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apotek-Sediaan</title>
</head>

<body>
    <h1>Data Sediaan</h1>
    <hr />
    <a href='index.php' style='text-decoration:none'>
        <img src='icon/back.ico' width='20' height='20' title='Back to Home' align='top' />
        <font color='brown'>Back to Home</font>
    </a>
    <br /><br />
    <?php
    //Connection
    $con = mysqli_connect("localhost", "root", "", "apotek");

    //Main
    if (isset($_GET['aksi'])) {
        switch ($_GET['aksi']) {
            case "edit":
                edit($con);
                view($con);
                break;
            case "hapus":
                hapus($con);
                break;
            default:
                echo "<h3>Aksi <i>" . $_GET['aksi'] . "</i> Belum Tersedia</h3>";
                add($con);
                view($con);
        }
    } else {
        add($con);
        view($con);
    }

    function view($con)
    {
        ?>

        <table border="1">
            <tr>
                <th>Kode</th>
                <th>Nama</th>
                <th>Aksi</th>
            </tr>
            <?php

            $sql = "SELECT * FROM sediaan";
            $result = mysqli_query($con, $sql);
            if (mysqli_num_rows($result) > 0) {
                while ($data = mysqli_fetch_array($result)) {
                    ?>
                    <tr>
                        <td>
                            <?= $data['kode']; ?>
                        </td>
                        <td>
                            <?= $data['nama']; ?>
                        </td>
                        <td align="center">
                            <a href="sediaan.php?aksi=edit&kd=<?= $data['kode']; ?>"><img src='icon/edit.ico' width='20' height='20'
                                    title='edit' /></a> |
                            <a href="sediaan.php?aksi=hapus&kd=<?= $data['kode']; ?>" onclick="return confirm('Yakin Hapus?')"><img
                                    src='icon/delete.ico' width='20' height='20' title='delete' /></a>
                        </td>
                    </tr>
                    <?php
                }
            } else {
                ?>
                <tr>
                    <td colspan="3" align="center"><i>Data Belum Ada</i></td>
                </tr>

                <?php
            }

            ?>

        </table>

        <?php

    }
    //Function add(INSERT)
    function add($con)
    {
        ?>
        <form action="" method="POST">
            <table border="0" cellspacing="5">
                <tr>
                    <td><input type="text" size="50" name="kode" placeholder="kode" required /></td>
                </tr>
                <tr>
                    <td><input type="text" size="50" name="nama" placeholder="nama" required /></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" name="insert" value="insert" />
                        <input type="reset" value="clear">
                    </td>
                </tr>
            </table>
        </form>
        <?php
        if (isset($_POST['insert'])) {
            $kd = $_POST['kode'];
            $nm = $_POST['nama'];

            $sql = "INSERT INTO sediaan (kode,nama) VALUES ('$kd', '$nm')";
            $result = mysqli_query($con, $sql);
            if ($result) {
                header("location: sediaan.php");
            }
        }
    }

    //Function edit (UPDATE)
    
    function edit($con)
    {
        $kd = $_GET['kd'];
        $sql = "SELECT * FROM sediaan WHERE kode='$kd'";
        $result = mysqli_query($con, $sql);
        while ($data = mysqli_fetch_array($result)) {
            ?>
            <form action="" method="POST">
                <table border="0" cellspacing="5">
                    <tr>
                        <td><input type="text" size="50" name="kode" placeholder="kode" value="<?= $data['kode']; ?>" readonly
                                required>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" size="50" name="nama" placeholder="nama" value="<?= $data['nama']; ?>" required
                                required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" name="update" value="Update">
                            <input type="reset" value="Clear">
                            <input type="button" value="Cancel" onclick="window.location.href='sediaan.php'">
                        </td>
                    </tr>
                </table>
            </form>
            <?php
        }
        if (isset($_POST['update'])) {
            $kd = $_POST['kode'];
            $nm = $_POST['nama'];

            $sql = "UPDATE sediaan SET nama='$nm' WHERE kode='$kd'";
            $result = mysqli_query($con, $sql);
            if ($result) {
                header("location: sediaan.php");
            } else {
                echo "Query Error : " . mysqli_error($con);
            }
        }
    }

    //Function hapus(DELETE)
    function hapus($con)
    {
        $kd = $_GET['kd'];
        $sql = "DELETE FROM sediaan WHERE kode='$kd'";
        $result = mysqli_query($con, $sql);
        if ($result) {
            header("location:sediaan.php");
        }
    }


    ?>

</body>

</html>