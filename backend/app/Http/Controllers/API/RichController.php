<?php

namespace App\Http\Controllers\API;

use Exception;
use App\Models\RichesHarta;

use App\Models\RichesUtang;
use Illuminate\Http\Request;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Expenditure;
use App\Models\Income;
use App\Models\Riches;
use Illuminate\Support\Facades\Auth;

class RichController extends Controller
{

    public function all(){
        $data = Riches::with('user')->where('users_id', Auth::user()->id)->get();
        return ResponseFormatter::success($data);
    }

    public function total(){
        $total_harta = RichesHarta::where('users_id',Auth::user()->id)->sum('rupiah');
        $total_hutang = RichesUtang::where('users_id',Auth::user()->id)->sum('rupiah');
        $total_kekayaan_bersih = $total_harta - $total_hutang;
        $total_penghasilan = Income::where('users_id',Auth::user()->id)->sum('penghasilan');
        $total_pengeluaran = Expenditure::where('users_id',Auth::user()->id)->sum('pengeluaran');
        $sisa_penghasilan = $total_penghasilan - $total_pengeluaran;
        $status = ($total_harta < $total_hutang) ? 'tidak-baik' : 'baik';


        $data = [
            'users_id' => Auth::user()->id,
            'total_harta' => $total_harta,
            'total_utang' => $total_hutang,
            'total_kekayaan_bersih' => $total_kekayaan_bersih,
            'status' => $status,
            'sisa_penghasilan' => $sisa_penghasilan,
        ];

        $user = Riches::where('users_id', Auth::user()->id)->first();
        // dd($data);
        if ($user == null) {
            Riches::create($data);
        }else{
            Riches::where('users_id', Auth::user()->id)->update($data);
        }

        return ResponseFormatter::success($data, 'Data berhasil diperbarui');
    }

    public function harta(Request $request){
        try {
            $request->validate([
                'harta' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $harta = RichesHarta::create([
                'users_id' => Auth::user()->id,
                'harta' => $request->harta,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success($harta, 'Harta berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateHarta(Request $request, $id){
        try {
            $request->validate([
                'harta' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);
            // dd($request);
            $harta = RichesHarta::find($id);
            $harta->harta = $request->harta;
            $harta->rupiah = $request->rupiah;
            $harta->save();

            return ResponseFormatter::success($harta, 'Harta berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteHarta($id){
        try {

            $harta = RichesHarta::find($id);
            $harta->delete();

            return ResponseFormatter::success($harta, 'Harta berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }

    // hutang
    public function hutang(Request $request){
        try {
            $request->validate([
                'utang' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $hutang = RichesUtang::create([
                'users_id' => Auth::user()->id,
                'utang' => $request->utang,
                'rupiah' => $request->rupiah
            ]);

            return ResponseFormatter::success($hutang, 'Hutang berhasil ditambahkan');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menambah data');
        }
    }

    public function updateHutang(Request $request){
        try {
            $request->validate([
                'utang' => 'string|required|max:225',
                'rupiah' => 'integer|required'
            ]);

            $hutang = RichesUtang::find($request->id);
            $hutang->utang = $request->utang;
            $hutang->rupiah = $request->rupiah;
            $hutang->save();

            return ResponseFormatter::success($hutang, 'Hutang berhasil diperbarui');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal mengubah data');
        }
    }

    public function deleteHutang($id){
        try {

            $hutang = RichesUtang::findo($id);
            $hutang->delete();

            return ResponseFormatter::success($hutang, 'Hutang berhasil dihapus');
        } catch (Exception $error) {
            return ResponseFormatter::error($error->getMessage(), 'gagal menghapus data');
        }
    }
}
